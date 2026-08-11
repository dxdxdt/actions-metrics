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
Updated: 2026-08-11T08:05:43.256392+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.646 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.163 | 18 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.130 | 4974 |
| us-east-2 | 0.127 | 1679 |
| us-gov-east-1 | 0.108 | 1820 |
| us-gov-west-1 | 0.226 | 216 |
| us-west-1 | 0.165 | 3920 |
| us-west-2 | 0.224 | 176 |

