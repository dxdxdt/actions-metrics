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
Updated: 2026-07-12T16:50:16.922329+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.880 |  |
| ap-east-1 | 0.803 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.896 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.428 |  |
| eu-south-1 | 0.419 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.549 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.060 | 4857 |
| us-east-2 | 0.085 | 1656 |
| us-gov-east-1 | 0.096 | 1740 |
| us-gov-west-1 | 0.296 | 202 |
| us-west-1 | 0.246 | 3772 |
| us-west-2 | 0.296 | 165 |

