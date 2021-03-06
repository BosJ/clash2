import CLaSH.Driver
import CLaSH.Rewrite.Types
import CLaSH.GHC.Evaluator
import CLaSH.GHC.GenerateBindings
import CLaSH.GHC.NetlistTypes
import CLaSH.Primitives.Util

genVHDL :: String
        -> IO ()
genVHDL src = do
  primMap <- generatePrimMap ["./primitives"]
  (bindingsMap,tcm) <- generateBindings primMap src
  generateVHDL bindingsMap primMap tcm ghcTypeToHWType reduceConstant DebugFinal

main :: IO ()
main = genVHDL "./examples/CalculatorArrow.hs"
