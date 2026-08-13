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
Updated: 2026-08-13T15:52:25.800413+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.858 |  |
| ap-southeast-4 | 0.747 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.175 | 18 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.132 | 4985 |
| us-east-2 | 0.148 | 1679 |
| us-gov-east-1 | 0.137 | 1825 |
| us-gov-west-1 | 0.230 | 222 |
| us-west-1 | 0.168 | 3939 |
| us-west-2 | 0.229 | 176 |

