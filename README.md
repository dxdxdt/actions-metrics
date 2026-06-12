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
Updated: 2026-06-12T21:27:42.667127+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.171 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.138 | 4747 |
| us-east-2 | 0.125 | 1632 |
| us-gov-east-1 | 0.123 | 1712 |
| us-gov-west-1 | 0.220 | 198 |
| us-west-1 | 0.186 | 3659 |
| us-west-2 | 0.220 | 163 |

