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
Updated: 2026-04-08T22:32:28.301914+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.900 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.143 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.449 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.085 | 4460 |
| us-east-2 | 0.119 | 1489 |
| us-gov-east-1 | 0.117 | 1634 |
| us-gov-west-1 | 0.289 | 192 |
| us-west-1 | 0.233 | 3381 |
| us-west-2 | 0.282 | 154 |

