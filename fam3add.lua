#!/usr/bin/env lua 

fam3 = arg[1]
dev  = arg[2]
val  = arg[3]
num  = 1

user = os.getenv("FAM3USER")
if user == nil then
  user = "anonymous"
end

pass = os.getenv("FAM3PASS")
if pass == nil then
  pass = "fam3@"
end

-- GET
url = string.format("ftp://%s:%s%s/\\VIRTUAL\\CMD\\D2FCSV_%s_2_%s_0_0_0_1_1_0", user, pass, fam3, dev, num )
--print(url)

local ftp = require "socket.ftp"
ftp.TIMEOUT = 10

f, e = ftp.get(url)

if f == nil then
  print(e)
  return
end

newval = tonumber(f) + tonumber(val)

-- PUT
url = string.format("ftp://%s:%s%s/\\VIRTUAL\\CMD\\F2DCSV_%s_-1_0_2_1_0_1_1", user, pass, fam3, dev )

f, e = ftp.put(url, tostring(newval))

if e ~= nil then
  print(e)
end
