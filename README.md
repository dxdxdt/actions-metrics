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
Updated: 2026-06-18T21:59:53.216484+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.861 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.760 |  |
| ap-northeast-1 | 0.649 |  |
| ap-northeast-2 | 0.751 |  |
| ap-northeast-3 | 0.667 |  |
| ap-south-1 | 0.816 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.890 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.942 |  |
| ap-southeast-4 | 0.859 |  |
| ap-southeast-5 | 0.910 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.379 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.419 |  |
| eu-south-1 | 0.401 |  |
| eu-south-2 | 0.415 |  |
| eu-west-1 | 0.299 |  |
| eu-west-2 | 0.330 |  |
| eu-west-3 | 0.355 |  |
| il-central-1 | 0.530 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.052 | 4771 |
| us-east-2 | 0.088 | 1635 |
| us-gov-east-1 | 0.089 | 1714 |
| us-gov-west-1 | 0.313 | 198 |
| us-west-1 | 0.278 | 3677 |
| us-west-2 | 0.310 | 163 |

