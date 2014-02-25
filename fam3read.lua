#!/usr/bin/env lua 

fam3 = arg[1]
dev  = arg[2]
num  = 3 <= table.getn(arg) and arg[3] or 1

user = os.getenv("FAM3USER")
if user == nil then
  user = "anonymous"
end

pass = os.getenv("FAM3PASS")
if pass == nil then
  pass = "fam3@"
end

url = string.format("ftp://%s:%s%s/\\VIRTUAL\\CMD\\D2FCSV_%s_2_%s_0_0_0_1_1_0", user, pass, fam3, dev, num )
--print(url)

local ftp = require "socket.ftp"
ftp.TIMEOUT = 10

f, e = ftp.get(url)

if f ~= nil then
  print(f)
else
  print(e)
end
