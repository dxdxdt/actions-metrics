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
Updated: 2026-10-27T23:24:12.922883+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.695 |  |
| ap-east-1 | 0.586 |  |
| ap-east-2 | 0.536 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.530 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.659 |  |
| ap-south-2 | 0.742 |  |
| ap-southeast-1 | 0.641 |  |
| ap-southeast-2 | 0.567 |  |
| ap-southeast-3 | 0.688 |  |
| ap-southeast-4 | 0.629 |  |
| ap-southeast-5 | 0.654 |  |
| ap-southeast-6 | 0.619 |  |
| ap-southeast-7 | 0.719 |  |
| ca-central-1 | 0.094 | 18 |
| ca-west-1 | 0.159 |  |
| eu-central-1 | 0.331 |  |
| eu-central-2 | 0.353 |  |
| eu-north-1 | 0.380 |  |
| eu-south-1 | 0.350 |  |
| eu-south-2 | 0.338 |  |
| eu-west-1 | 0.276 |  |
| eu-west-2 | 0.311 |  |
| eu-west-3 | 0.317 |  |
| il-central-1 | 0.454 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.164 |  |
| sa-east-1 | 0.427 |  |
| us-east-1 | 0.063 | 5164 |
| us-east-2 | 0.073 | 1713 |
| us-gov-east-1 | 0.086 | 1955 |
| us-gov-west-1 | 0.206 | 240 |
| us-west-1 | 0.166 | 4196 |
| us-west-2 | 0.204 | 195 |

