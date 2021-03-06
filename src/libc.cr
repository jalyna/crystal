lib LibC
  ifdef x86_64
    alias SizeT = UInt64
    alias SSizeT = Int64
  else
    alias SizeT = UInt32
    alias SSizeT = Int32
  end

  alias Char = UInt8
  alias SChar = Int8
  alias Short = Int16
  alias UShort = UInt16
  alias Int = Int32
  alias UInt = UInt32
  alias Long = SSizeT
  alias ULong = SizeT
  alias LongLong = Int64
  alias ULongLong = UInt64

  alias PtrDiffT = SSizeT
  alias TimeT = SSizeT

  ifdef darwin
    alias ModeT = UInt16
  elsif linux
    alias ModeT = UInt32
  end

  fun malloc(size : SizeT) : Void*
  fun realloc(ptr : Void*, size : SizeT) : Void*
  fun free(ptr : Void*)
  fun time(t : TimeT) : TimeT
  fun free(ptr : Void*)
  fun memcmp(p1 : Void*, p2 : Void*, size : SizeT) : Int32
  fun _exit(status : Int32) : NoReturn

  PROT_NONE = 0x00
  PROT_READ = 0x01
  PROT_WRITE = 0x02
  PROT_EXEC = 0x04
  MAP_SHARED = 0x0001
  MAP_PRIVATE = 0x0002

  ifdef darwin
    MAP_ANON = 0x1000
  end
  ifdef linux
    MAP_ANON = 0x0020
  end

  fun mmap(addr : Void*, len : SizeT, prot : Int, flags : Int, fd : Int, offset : SSizeT) : Void*
  fun munmap(addr : Void*, len : SizeT)


  # used by [event, io, time]
  struct TimeSpec
    tv_sec  : LibC::TimeT
    tv_nsec : LibC::TimeT
  end

  ifdef darwin
    alias UsecT = Int32
  else
    alias UsecT = Long
  end

  # used by [file/stat, time]
  struct TimeVal
    tv_sec  : LibC::TimeT
    tv_usec : LibC::UsecT
  end
end
