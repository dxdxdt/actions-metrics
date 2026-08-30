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
Updated: 2026-08-30T14:10:17.449331+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.516 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.943 |  |
| ap-south-2 | 0.983 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.675 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.210 | 18 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.195 |  |
| sa-east-1 | 0.628 |  |
| us-east-1 | 0.165 | 5074 |
| us-east-2 | 0.164 | 1684 |
| us-gov-east-1 | 0.143 | 1891 |
| us-gov-west-1 | 0.189 | 228 |
| us-west-1 | 0.132 | 4069 |
| us-west-2 | 0.188 | 189 |

