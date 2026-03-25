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
Updated: 2026-03-25T20:32:06.325915+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.999 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.848 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.174 | 4358 |
| us-east-2 | 0.166 | 1454 |
| us-gov-east-1 | 0.159 | 1604 |
| us-gov-west-1 | 0.186 | 190 |
| us-west-1 | 0.131 | 3297 |
| us-west-2 | 0.185 | 151 |

