object PhaseRotatorModule: TPhaseRotatorModule
  OnCreate = VSTModuleCreate
  OnDestroy = VSTModuleDestroy
  Flags = [effFlagsHasEditor, effFlagsCanReplacing]
  Version = '1.0'
  EffectName = 'Phase Rotator'
  ProductName = 'DAV Effect Examples'
  VendorName = 'Delphi ASIO & VST Project'
  PlugCategory = vpcEffect
  SampleRate = 44100.000000000000000000
  CurrentProgramName = 'Default'
  IORatio = 1.000000000000000000
  UniqueID = 'PhRo'
  ShellPlugins = <>
  Programs = <
    item
      DisplayName = 'Default'
      VSTModule = Owner
    end>
  ParameterProperties = <
    item
      Curve = ctLogarithmic
      CurveFactor = 1000.000000000000000000
      DisplayName = 'Frequency'
      Flags = [ppfParameterUsesFloatStep, ppfParameterSupportsDisplayIndex, ppfParameterSupportsDisplayCategory]
      LargeStepFloat = 2.000000000000000000
      Max = 20000.000000000000000000
      MaxInteger = 20000
      Min = 20.000000000000000000
      MinInteger = 20
      ReportVST2Properties = True
      ShortLabel = 'Freq.'
      SmallStepFloat = 0.500000000000000000
      StepFloat = 1.000000000000000000
      Units = 'Hz'
      UseDefaultString2ParameterHandler = True
      VSTModule = Owner
      OnParameterChange = ParameterFrequencyChange
      OnCustomParameterLabel = ParameterFrequencyLabel
      OnCustomParameterDisplay = ParameterFrequencyDisplay
    end
    item
      Curve = ctLogarithmic
      CurveFactor = 2.000000000000000000
      DisplayName = 'Order'
      Flags = [ppfParameterUsesIntegerMinMax, ppfParameterUsesIntStep, ppfParameterSupportsDisplayIndex]
      LargeStepFloat = 2.000000000000000000
      LargeStepInteger = 2
      Max = 8.000000000000000000
      MaxInteger = 8
      ReportVST2Properties = True
      ShortLabel = 'Order'
      SmallStepFloat = 1.000000000000000000
      StepFloat = 1.000000000000000000
      VSTModule = Owner
      OnParameterChange = ParameterOrderChange
      OnCustomParameterDisplay = ParameterOrderDisplay
    end
    item
      CurveFactor = 1.000000000000000000
      DisplayName = 'Bandwidth'
      Flags = [ppfParameterUsesFloatStep, ppfParameterSupportsDisplayIndex]
      LargeStepFloat = 2.000000000000000000
      Max = 10.000000000000000000
      MaxInteger = 10
      Min = 0.009999999776482582
      ReportVST2Properties = True
      ShortLabel = 'BW'
      SmallStepFloat = 0.500000000000000000
      StepFloat = 1.000000000000000000
      Units = 'Oct'
      UseDefaultString2ParameterHandler = True
      VSTModule = Owner
      OnParameterChange = ParameterBandwidthChange
      OnCustomParameterDisplay = ParameterBandwidthDisplay
    end>
  ParameterCategories = <>
  OnOpen = VSTModuleOpen
  OnClose = VSTModuleClose
  OnProcess = VSTModuleProcess
  OnProcess32Replacing = VSTModuleProcess
  OnProcessMidi = VSTModuleProcessMidi
  OnSampleRateChange = VSTModuleSampleRateChange
  Height = 150
  Width = 215
end
