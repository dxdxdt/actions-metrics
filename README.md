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
Updated: 2026-03-09T11:30:21.855160+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.974 |  |
| ap-south-2 | 0.981 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.185 | 4246 |
| us-east-2 | 0.147 | 1411 |
| us-gov-east-1 | 0.148 | 1547 |
| us-gov-west-1 | 0.160 | 176 |
| us-west-1 | 0.155 | 3201 |
| us-west-2 | 0.160 | 144 |

