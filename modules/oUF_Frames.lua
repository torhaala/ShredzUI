-- ------------------------------------------------------------------------
-- > oUF Lybrial (Lybrial @ Blackhand EU) <
-- ------------------------------------------------------------------------
-- Version: 1.0
-- ------------------------------------------------------------------------

local _, ns = ...
local oUF = ns.oUF

local UnitSpecific = {
	player = function(self)
		self:SetWidth(570)
		self:SetHeight(47)
	end,
	pet = function(self)
		self:SetWidth(141)
		self:SetHeight(70)
	end,
	target = function(self)
		self:SetWidth(570)
		self:SetHeight(47)
	end,
	targettarget = function(self)
		self:SetWidth(141)
		self:SetHeight(70)
	end
}

local function Shared(self, unit)
	self:RegisterForClicks('AnyUp')
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)

	if (UnitSpecific[unit]) then
		return UnitSpecific[unit](self)
	end
end

oUF:RegisterStyle('Lybrial', Shared)
oUF:Factory(function(self)
	self:SetActiveStyle('Lybrial')
	self:Spawn('player'):SetPoint('CENTER', -245, -402)
	self:Spawn('pet'):SetPoint('CENTER', -238, -444)
	self:Spawn('target'):SetPoint('CENTER', 245, -392)
	self:Spawn('targettarget'):SetPoint('CENTER', 240, -433)
end)