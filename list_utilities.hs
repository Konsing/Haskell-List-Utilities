-- Problem 1
myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates list
  | null list = []
  | elem (head list) (tail list) = myremoveduplicates (tail list)
  | otherwise = head list : myremoveduplicates (tail list)

myremoveduplicates_pm :: Eq a => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs)
  | elem x xs = myremoveduplicates_pm xs
  | otherwise = x : myremoveduplicates_pm xs
-- Problem 2
myintersection :: Eq a => [a] -> [a] -> [a]
myintersection list1 list2
  | null list1 || null list2 = []
  | elem (head list1) list2 = head list1 : myintersection (tail list1) list2
  | otherwise = myintersection (tail list1) list2

myintersection_pm :: Eq a => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm _ [] = []
myintersection_pm (x:xs) list
  | elem x list = x : myintersection_pm xs list
  | otherwise = myintersection_pm xs list
-- Problem 3
mynthtail :: Int -> [a] -> [a]
mynthtail n list
  | n <= 0 || null list = list
  | otherwise = mynthtail (n - 1) (tail list)

mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 list = list
mynthtail_pm _ [] = []
mynthtail_pm n (_:xs) = mynthtail_pm (n - 1) xs
-- Problem 4
mylast :: [a] -> [a]
mylast list
  | null list = []
  | null (tail list) = [head list]
  | otherwise = mylast (tail list)

mylast_pm :: [a] -> [a]
mylast_pm [] = []
mylast_pm [x] = [x]
mylast_pm (_:xs) = mylast_pm xs
-- Problem 5
myreverse :: [a] -> [a]
myreverse list = myreverse' list []
  where
    myreverse' lst acc
      | null lst = acc
      | otherwise = myreverse' (tail lst) (head lst : acc)

myreverse_pm :: [a] -> [a]
myreverse_pm list = myreverse_pm' list []
  where
    myreverse_pm' [] acc = acc
    myreverse_pm' (x:xs) acc = myreverse_pm' xs (x:acc)
-- Problem 6
myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall _ _ [] = []
myreplaceall old new list
  | head list == new = old : myreplaceall old new (tail list)
  | otherwise = head list : myreplaceall old new (tail list)

myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []
myreplaceall_pm old new (x:xs)
  | x == new = old : myreplaceall_pm old new xs
  | otherwise = x : myreplaceall_pm old new xs

-- Problem 7
myordered :: Ord a => [a] -> Bool
myordered list
  | null list || null (tail list) = True
  | head list > head (tail list) = False
  | otherwise = myordered (tail list)

myordered_pm :: Ord a => [a] -> Bool
myordered_pm [] = True
myordered_pm [_] = True
myordered_pm (x:y:rest)
  | x > y = False
  | otherwise = myordered_pm (y:rest)
-- Problem 8
computeFees :: String -> Int
computeFees input = 
    let fields = splitBySemicolon input
        age = read (fields !! 3) :: Int
        credits = read (fields !! 4) :: Int
        isDegreeSeeking = (fields !! 5) == "Y"
        hasFinAid = if isDegreeSeeking then (fields !! 8) == "Y" else False
        finAssistAmount = if hasFinAid then read (fields !! 9) :: Int else 0
        studentType = if isDegreeSeeking then "E" else fields !! 6
    in case studentType of
        "E" -> computeDegreeStudentFees credits hasFinAid finAssistAmount
        "S" -> computeSeniorCitizenFees age credits
        "C" -> computeCertificateStudentFees credits
        _   -> 0

computeDegreeStudentFees :: Int -> Bool -> Int -> Int
computeDegreeStudentFees credits hasFinAid finAssistAmount =
    let baseFee = 100  -- Recreation and athletics fee
        unionFee = 50   -- Student union fee
        perCreditFee = 275
        fee = baseFee + unionFee + (min credits 12 * perCreditFee)
        finalFee = if hasFinAid then fee - finAssistAmount else fee
    in max finalFee 0

computeSeniorCitizenFees :: Int -> Int -> Int
computeSeniorCitizenFees age credits =
    if age >= 65 then
        if credits <= 6 then 100
        else 100 + 50 * (credits - 6)
    else 0

computeCertificateStudentFees :: Int -> Int
computeCertificateStudentFees credits = 700 + 300 * credits

splitBySemicolon :: String -> [String]
splitBySemicolon [] = [""]
splitBySemicolon (c:cs)
    | c == ';'  = "" : rest
    | otherwise = (c : head rest) : tail rest
    where rest = splitBySemicolon cs