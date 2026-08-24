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
Updated: 2026-08-24T08:38:31.330554+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.975 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.172 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.143 | 5051 |
| us-east-2 | 0.148 | 1682 |
| us-gov-east-1 | 0.132 | 1878 |
| us-gov-west-1 | 0.225 | 226 |
| us-west-1 | 0.164 | 4044 |
| us-west-2 | 0.224 | 185 |

