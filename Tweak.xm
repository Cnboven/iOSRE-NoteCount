#import "note.h"
%hook ICNoteEditorViewController

- (void)viewDidLoad
{
      %orig;
      [self setTitle:@"Boven Count!"];
}

- (void)viewWillAppear:(BOOL)arg1 // initialize title
{
      %orig;
      [self setTitle:@"Boven Count!"];
}

- (void)viewDidDisappear:(BOOL)arg1 // reset title
{
      %orig;
      self.title = nil;
}

- (void)textViewDidChange:(UITextView *)arg1 // Update title
{
      %orig;
      NSString *content = self.textView.text;
      NSString *contentLength = [NSString stringWithFormat:@"%lu",(unsigned long)[content length]];
      self.title = contentLength;
}
%end
