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
Updated: 2026-03-09T12:42:27.995138+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.797 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.118 | 4247 |
| us-east-2 | 0.122 | 1411 |
| us-gov-east-1 | 0.131 | 1547 |
| us-gov-west-1 | 0.238 | 176 |
| us-west-1 | 0.203 | 3201 |
| us-west-2 | 0.238 | 144 |

