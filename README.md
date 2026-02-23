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
Updated: 2026-02-23T06:01:07.508846+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.707 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.727 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.830 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.162 | 4169 |
| us-east-2 | 0.168 | 1371 |
| us-gov-east-1 | 0.169 | 1501 |
| us-gov-west-1 | 0.205 | 160 |
| us-west-1 | 0.159 | 3100 |
| us-west-2 | 0.206 | 130 |

