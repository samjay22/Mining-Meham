--!strict
local BreakableTypes = require(game.ReplicatedStorage.Types.Breakable)
local InteractionTypes = require(game.ReplicatedStorage.Types.Interaction)
local EntityType = require(game.ReplicatedStorage.Types.Entity)
local Entity = require(game.ReplicatedStorage.Metadata.Entity)
local Breakable = require(game.ReplicatedStorage.Metadata.Breakables)
local Interaction = require(game.ReplicatedStorage.Metadata.InteractionTypes)

type InteractionData = InteractionTypes.InteractionData
local function _onInteractionTriggered(self : EntityType.BreakableEntity, entityId : number, interactionId : number, interactionData : InteractionData)
    if Interaction.GetInteactionTypeById(interactionId).SystemName == "DAMAGE" then
        self.InteractionQueue:Enqueue(function()
            if self.CurrentHealth > 0 and self.CanTakeDamage then
                self.CurrentHealth -= 
                    (interactionData :: InteractionTypes.DamageInteraction & 
                    InteractionTypes.InteractionData).DamageAmount
            elseif self.CurrentHealth <= 0 and self.CanTakeDamage then
                self:OnEntityBreak(entityId)
            end
        end)
    end
end

local function _onUpdate(self : EntityType.BaseEntity)
    if self.InteractionQueue:Peek() then
        self.InteractionQueue:Dequeue()()
    end 
    --any other update logic
end

local function _onEntityDestroyed(self : EntityType.BreakableEntity)
    Entity.RemoveEntityById(self.Id)
end

local function _onEntityBreak(self : EntityType.BreakableEntity, entityThatBrokeId : number)
    --Add break reward
    local breakableItem : BreakableTypes.BreakableItem? = Breakable.GetBreakableItemFromSystemName(self.SystemName)
    if not breakableItem then return end

    local breakReward : BreakableTypes.BreakReward = Breakable.GetBreakRewardFromId(breakableItem.BreakRewardId)
    local rewardAmount : number = math.random(breakReward.Min, breakReward.Max)
    warn(rewardAmount, entityThatBrokeId)
    --Add reward to player inventory
    --Remove entity
    self:OnEntityDestroyed()
end

return {
    CreateNewBreakableNode = function(breakableId : number) : string
        local breakableItem : BreakableTypes.BreakableItem = Breakable.GetBreakableItemFromId(breakableId)
        local EntityId : string = Entity.AddNewEntity(breakableItem, true, _onInteractionTriggered, 
            _onUpdate,
            _onEntityDestroyed
        )

        local entityInstance : EntityType.BreakableEntity = Entity.GetEntityById(EntityId) :: EntityType.BreakableEntity
        entityInstance.Position = Vector3.new()
        entityInstance.MaxHealth = breakableItem.MaxHealth
        entityInstance.CurrentHealth = breakableItem.MaxHealth
        entityInstance.OnEntityBreak = _onEntityBreak
        
        --Clone model and set position
        --Set up interactions
        --deal with updates

        return EntityId
    end
}