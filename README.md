# Haskell List Utilities

A collection of utility functions for list manipulation implemented in Haskell.

## Functions

1. **Remove Duplicates**
   - `myremoveduplicates :: Eq a => [a] -> [a]`
   - `myremoveduplicates_pm :: Eq a => [a] -> [a]`
   
2. **Intersection**
   - `myintersection :: Eq a => [a] -> [a] -> [a]`
   - `myintersection_pm :: Eq a => [a] -> [a] -> [a]`

3. **Nth Tail**
   - `mynthtail :: Int -> [a] -> [a]`
   - `mynthtail_pm :: Int -> [a] -> [a]`

4. **Last Element**
   - `mylast :: [a] -> [a]`
   - `mylast_pm :: [a] -> [a]`

5. **Reverse List**
   - `myreverse :: [a] -> [a]`
   - `myreverse_pm :: [a] -> [a]`

6. **Replace All Occurrences**
   - `myreplaceall :: Eq a => a -> a -> [a] -> [a]`
   - `myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]`

## How to Use

Each function has two implementations: one using guards and the other using pattern matching. You can use these functions by importing the corresponding module into your Haskell project.

```haskell
import HaskellListUtilities
