#  CollectionAddRemove

- SwiftUI List & ForEach -- 

- Tried to make sure all paths to adding duplicate items are addressed (no duplicates allowed)
- Mac version has delete button; iOS does swipe deletion.

## Current issues/bugs
- When editing an item, if you delete the text of the instance, the state variable for that remains what it was before you did the delete. This means that if you click OK at that point, the instance will be the old (invisible) value. I probably should change this TextField so it does regular String type stuff, and then convert to an Int when ready to save.
