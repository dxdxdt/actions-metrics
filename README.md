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
Updated: 2026-02-27T12:39:54.895137+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.749 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.803 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.126 | 4194 |
| us-east-2 | 0.113 | 1382 |
| us-gov-east-1 | 0.111 | 1514 |
| us-gov-west-1 | 0.210 | 162 |
| us-west-1 | 0.202 | 3131 |
| us-west-2 | 0.212 | 133 |

