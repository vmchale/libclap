module Text.Convert.Parens ( toParens ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercase :: [Char]
uppercase = ['🄐','🄑','🄒','🄓','🄔','🄕','🄖','🄗','🄘','🄙','🄚','🄛','🄜','🄝','🄞','🄟','🄠','🄡','🄣','🄤','🄥','🄦','🄧','🄨','🄩']

scriptLowercase :: [Char]
scriptLowercase = ['⒜','⒝','⒞','⒟','⒠','⒡','⒢','⒣','⒞','⒤','⒥','⒦','⒧','⒨','⒩','⒪','⒫','⒬','⒭','⒯','⒮','⒯','⒰','⒱','⒲','⒳','⒴','⒵']

scriptTable :: M.Map Char Char
scriptTable = M.fromList $
    zip alphabet (uppercase ++ scriptLowercase)

-- | \\( O(n) \\)
toParens :: String -> String
toParens = fmap (withCharTable scriptTable)
