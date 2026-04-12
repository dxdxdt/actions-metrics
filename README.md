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
Updated: 2026-04-12T16:29:56.078131+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.672 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.189 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.114 | 4488 |
| us-east-2 | 0.098 | 1497 |
| us-gov-east-1 | 0.095 | 1644 |
| us-gov-west-1 | 0.228 | 192 |
| us-west-1 | 0.176 | 3401 |
| us-west-2 | 0.228 | 155 |

