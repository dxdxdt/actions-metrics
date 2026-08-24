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
Updated: 2026-08-24T20:20:54.583821+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.698 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.247 | 18 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.185 | 5054 |
| us-east-2 | 0.205 | 1683 |
| us-gov-east-1 | 0.208 | 1880 |
| us-gov-west-1 | 0.192 | 227 |
| us-west-1 | 0.131 | 4048 |
| us-west-2 | 0.191 | 186 |

