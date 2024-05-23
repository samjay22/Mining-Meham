--!strict
local EntityType = require(game.ReplicatedStorage.Types.Entity)
local Entity = require(game.ReplicatedStorage.Metadata.Entity)
local Breakable = require(game.ReplicatedStorage.Metadata.Breakables)
local Interaction = require(game.ReplicatedStorage.Metadata.InteractionTypes)

--this can be optmized, but we have this for show and tell
local EntityId : string = Entity.AddNewEntity(
    Breakable.GetBreakRewardFromId(1), 
    true,
    function(self : EntityType.BreakableEntity, entityId, interactionId, interactionData)
        if Interaction.GetInteactionTypeById(interactionId).SystemName == "DAMAGE" then
            self.InteractionQueue:Enqueue(function()
                if self.CurrentHealth > 0 and self.CanTakeDamage then
                    self.CurrentHealth -= interactionData.DamageAmount
                end
            end)
        end
    end,
    function(self : EntityType.BreakableEntity)
       if self.InteractionQueue:Peek() then
            self.InteractionQueue:Dequeue()()
       end 

       --any other update logic
    end,
    --cleanup function last
)