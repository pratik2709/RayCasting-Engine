--[[ Stack
A Simple Stack in Lua

Functions:
* push
* pop
* peek
* isEmpty
]]--

Stack = {}
Stack.__index = Stack
function Stack.new()
  return setmetatable({}, Stack)
end

function Stack:push(input)
  self[#self+1] = input
end

function Stack:pop()
  if self:isEmpty() then
    return -1
  end

	local tmp = self[#self]
	self[#self] = nil
	return tmp
end

function Stack:peek()
  if self:isEmpty() then
    return -1
  end

  return self[#self]
end

function Stack:isEmpty()
  return #self == 0
end