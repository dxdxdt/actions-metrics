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
Updated: 2026-07-12T14:27:57.281156+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.747 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.509 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.141 | 4855 |
| us-east-2 | 0.150 | 1656 |
| us-gov-east-1 | 0.133 | 1740 |
| us-gov-west-1 | 0.224 | 202 |
| us-west-1 | 0.173 | 3772 |
| us-west-2 | 0.224 | 165 |

