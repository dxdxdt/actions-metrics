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
Updated: 2026-03-27T23:25:38.341551+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.745 |  |
| ap-southeast-5 | 0.819 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.669 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.808 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.133 | 4373 |
| us-east-2 | 0.135 | 1458 |
| us-gov-east-1 | 0.121 | 1610 |
| us-gov-west-1 | 0.226 | 190 |
| us-west-1 | 0.174 | 3312 |
| us-west-2 | 0.225 | 151 |

