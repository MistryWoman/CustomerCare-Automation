
from appJar import gui
import webbrowser


###
#Main Menu Window
def mainPress(button):
    if button == 'Speak':
        # add snippet for google speech
        #close()
        webbrowser.open_new(
    'https://www.google.com/intl/en/chrome/demos/speech.html')

    else:
        app.showSubWindow('Routing Codes')


app = gui('Customer Care AI', '800x600')
app.setBg('Orange')
app.setLabelFont(72,'Times')
font = 'Times 72 normal'

#Labels
app.addLabel('title1','Customer Care Call:')
app.setLabelBg('title1','blue')
app.setLabelFg('title1','white')

#Buttons
app.addButtons(['Speak','Routing Code'],mainPress)
app.setButtonFont(72,'Times')

###<<< Routing Code Window >>>###
app.startSubWindow('Routing Codes', modal=True)
app.setBg('Orange')
app.setGeometry("800x600")
app.setFont(42)
app.addLabel('title2','    Routing Codes    ')
app.setLabelBg('title2','blue')
app.setLabelFg('title2','white')
app.setLabelFont(42,'Times')
#Label Entries
app.addLabel('code1','Code : 1 - Route to POSTPAID')
app.setLabelFg('code1','white')
app.setLabelBg('code1','red')
app.addLabel('code2','Code : 2 - Route to PREPAID')
app.setLabelFg('code2','white')
app.setLabelBg('code2','red')

#Buttons
app.stopSubWindow()
###<<<------------------->>>###

# #Readings Window
# def windowPress(button):
#     if button == 'Start':
#         print('Readings starting now: ')
#         global values
#         values = emg()
#         plotting(values[1] ,values[0] )
#         #print('Reached readings code')
#         #app.hideSubWindow('Readings')

#     else:
#         filecreating(values[0],file_name)
#         close()
#         app.hideSubWindow('Readings')
    
# ###<<< Readings Window >>>###         
# app.startSubWindow('Readings', modal=True)
# app.setBg('Orange')
# app.setGeometry("1000x800")
# app.setFont(72)
# app.addLabel('promt','Click Start to begin taking readings')
# app.setLabelFg('promt','white')
# app.setLabelBg('promt','blue')
# app.addMeter('Readings')
# app.setMeterFill('Readings','red')        
# app.addButtons(['Start','Finish'],windowPress)
# app.stopSubWindow()
###<<<------------------->>>###
            
#starting main GUI
app.go()

