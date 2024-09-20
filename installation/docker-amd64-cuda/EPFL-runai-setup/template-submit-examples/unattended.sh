runai submit \
  --name example-unattended \
  --image registry.rcp.epfl.ch/claire/moalla/claire-intro:amd64-cuda-moalla-latest \
  --pvc runai-claire-moalla-scratch:/claire-rcp-scratch \
  --working-dir /claire-rcp-scratch/home/moalla/claire-intro/run \
  -e PROJECT_ROOT_AT=/claire-rcp-scratch/home/moalla/claire-intro/run \
  -g 1 --cpu 8 --cpu-limit 8 --memory 64G --memory-limit 64G \
  -- python -m claire_intro.template_experiment some_arg=2 wandb.mode=offline

# template_experiment is an actual script that you can run.
# or -- zsh claire_intro/reproducibility-scripts/template-experiment.sh

# To separate the dev state of the project from frozen checkouts to be used in unattended jobs you can observe that
# we're pointing to the .../run instance of the repository on the PVC.
# That would be a copy of the claire-intro repo frozen in a commit at a working state to be used in unattended jobs.
# Otherwise while developing we would change the code that would be picked by newly scheduled jobs.

# Useful commands.
# runai describe job example-unattended
# runai logs example-unattended
