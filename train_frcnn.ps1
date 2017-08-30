$pathToSourceRoot = "C:\Users\Alex\Repositories\keras-frcnn\"
$pathToTranscript = "$($pathToSourceRoot)"

# Allowing wider outputs https://stackoverflow.com/questions/7158142/prevent-powergui-from-truncating-the-output
$pshost = get-host
$pswindow = $pshost.ui.rawui
$newsize = $pswindow.buffersize
$newsize.height = 9999
$newsize.width = 1500
$pswindow.buffersize = $newsize

cd $pathToSourceRoot
echo "Appending source root $($pathToSourceRoot) to temporary PYTHONPATH"
$env:PYTHONPATH = $pathToSourceRoot

# Started on Donkey, 17.08.2017
Start-Transcript -path "$($pathToTranscript)2017-08-18_train_frcnn.txt" -append
python "$($pathToSourceRoot)train_frcnn.py" --path "$($pathToSourceRoot)VOC_Data"
Stop-Transcript