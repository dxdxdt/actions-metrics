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
Updated: 2026-02-27T14:35:33.175523+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.078 |  |
| ap-east-1 | 0.640 |  |
| ap-east-2 | 0.578 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.574 |  |
| ap-northeast-3 | 0.489 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.715 |  |
| ap-southeast-2 | 0.600 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.735 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.818 |  |
| ca-central-1 | 0.287 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.583 |  |
| eu-central-2 | 0.611 |  |
| eu-north-1 | 0.622 |  |
| eu-south-1 | 0.599 |  |
| eu-south-2 | 0.621 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.542 |  |
| eu-west-3 | 0.572 |  |
| il-central-1 | 0.749 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.928 |  |
| mx-central-1 | 0.270 |  |
| sa-east-1 | 0.697 |  |
| us-east-1 | 0.237 | 4194 |
| us-east-2 | 0.211 | 1382 |
| us-gov-east-1 | 0.210 | 1514 |
| us-gov-west-1 | 0.123 | 162 |
| us-west-1 | 0.080 | 3133 |
| us-west-2 | 0.124 | 133 |

