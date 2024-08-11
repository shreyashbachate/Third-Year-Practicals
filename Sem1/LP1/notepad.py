from tkinter import *
import tkinter as tk
from tkinter.scrolledtext import ScrolledText
from tkinter import filedialog
from tkinter import messagebox
from datetime import datetime



root = Tk()
menu = Menu(root)
root.config(menu=menu)





text = ScrolledText(root,width=720,height=720,undo=True)
text.pack(fill=tk.BOTH)




def date():
    d = datetime.now()
    text.insert('end',d)

def cut():
    text.event_generate("<<Cut>>")

def copy():
    text.event_generate("<<Copy>>")

def paste():
    text.event_generate("<<Paste>>")

def undo():
    text.event_generate("<<Undo>>")

def redo():
    text.event_generate("<<Redo>>")

def delete():
    text.delete('1.0','end')

def new():
    text.delete('1.0','end')

def new_window():
    root = tk.Tk()
    root.geometry("500*500")

def exit():
    message = messagebox.askquestion('Notepad','Do you want to exit')
    if message == 'Yes':
        save_as()
    else:
        root.destroy()

def save():
    pass

def save_as():
    root.filename = filedialog.asksaveasfile(mode='w',defaultextension='.txt')
    if root.filename is None:
        return
    file_save = str(text.get('1.0',END))
    root.filename.write(file_save)
    root.filename.close()

def open():
    root.filename = filedialog.askopenfile(
        initialdir="/",
        title="Select File",
        filetypes=(("jpg files","*.jpg"),("All files","*.*"))
    )
    file = open(root.filename)
    text.insert('end',file.read())






filemenu = Menu(menu)
menu.add_cascade(label="File",menu=filemenu)
filemenu.add_command(label="New",command=new)
filemenu.add_command(label="New Window",command=new_window)
filemenu.add_command(label="Open",command=open)
filemenu.add_command(label="Save",command=save)
filemenu.add_command(label="Save As",command=save_as)
filemenu.add_command(label="Exit",command=exit)

editmenu = Menu(menu)
menu.add_cascade(label="Edit",menu=editmenu)
editmenu.add_command(label="Undo",command=undo,accelerator="Ctrl+Z")
editmenu.add_command(label="Redo",command=redo,accelerator="Ctrl+Y")
editmenu.add_separator()
editmenu.add_command(label="Cut",command=cut,accelerator="Ctrl+X")
editmenu.add_command(label="Copy",command=copy,accelerator="Ctrl+C")
editmenu.add_command(label="Paste",command=paste,accelerator="Ctrl+V")
editmenu.add_separator()
editmenu.add_command(label="Delete",command=delete,accelerator="delete")
editmenu.add_command(label="Select All",accelerator="Ctrl+A")


fromatmenu = Menu(menu)
menu.add_cascade(label="Format",menu=fromatmenu)
fromatmenu.add_command(label="Word Wrap")
fromatmenu.add_command(label="Font")
fromatmenu.add_command(label="Date",command=date)

helpmenu = Menu(menu)
menu.add_cascade(label="Help",menu=helpmenu)
helpmenu.add_command(label="View Help")
helpmenu.add_command(label="Send Feedback")
helpmenu.add_command(label="About Notepad")

mainloop()


