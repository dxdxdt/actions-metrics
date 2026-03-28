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
Updated: 2026-03-28T01:24:10.409494+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.492 |  |
| ap-northeast-2 | 0.604 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.674 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.270 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.571 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.729 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.869 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.676 |  |
| us-east-1 | 0.206 | 4373 |
| us-east-2 | 0.190 | 1458 |
| us-gov-east-1 | 0.182 | 1610 |
| us-gov-west-1 | 0.160 | 190 |
| us-west-1 | 0.106 | 3313 |
| us-west-2 | 0.158 | 151 |

