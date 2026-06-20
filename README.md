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
Updated: 2026-06-20T21:07:26.511113+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.817 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.642 |  |
| ap-northeast-2 | 0.743 |  |
| ap-northeast-3 | 0.669 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.894 |  |
| ap-southeast-2 | 0.783 |  |
| ap-southeast-3 | 0.950 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.387 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.422 |  |
| eu-west-1 | 0.312 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.367 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.066 | 4778 |
| us-east-2 | 0.104 | 1636 |
| us-gov-east-1 | 0.106 | 1715 |
| us-gov-west-1 | 0.309 | 198 |
| us-west-1 | 0.260 | 3686 |
| us-west-2 | 0.309 | 163 |

