module Paths_backprop_mnist (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [1,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/space/.cabal/bin"
libdir     = "/home/space/.cabal/lib/backprop-mnist-1.0/ghc-7.6.3"
datadir    = "/home/space/.cabal/share/backprop-mnist-1.0"
libexecdir = "/home/space/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "backprop_mnist_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "backprop_mnist_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "backprop_mnist_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "backprop_mnist_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
