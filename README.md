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
Updated: 2026-03-22T13:39:31.016948+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.733 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.809 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.135 | 4329 |
| us-east-2 | 0.148 | 1446 |
| us-gov-east-1 | 0.149 | 1595 |
| us-gov-west-1 | 0.257 | 189 |
| us-west-1 | 0.198 | 3280 |
| us-west-2 | 0.245 | 151 |

