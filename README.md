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
Updated: 2026-08-10T01:06:22.817294+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.166 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.456 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.119 | 4965 |
| us-east-2 | 0.137 | 1678 |
| us-gov-east-1 | 0.134 | 1814 |
| us-gov-west-1 | 0.234 | 215 |
| us-west-1 | 0.210 | 3915 |
| us-west-2 | 0.235 | 175 |

