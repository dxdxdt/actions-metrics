# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-09-25T17:40:33.533232+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.168 | 18 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.141 | 5121 |
| us-east-2 | 0.136 | 1686 |
| us-gov-east-1 | 0.135 | 1928 |
| us-gov-west-1 | 0.218 | 235 |
| us-west-1 | 0.158 | 4137 |
| us-west-2 | 0.215 | 192 |

