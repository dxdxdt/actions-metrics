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
Updated: 2026-04-14T04:40:53.006301+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.866 |  |
| ap-east-1 | 0.818 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.770 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.814 |  |
| ap-southeast-3 | 0.960 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.913 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.996 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.319 |  |
| eu-central-1 | 0.377 |  |
| eu-central-2 | 0.397 |  |
| eu-north-1 | 0.443 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.305 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.546 |  |
| me-central-1 | 0.756 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.478 |  |
| us-east-1 | 0.053 | 4498 |
| us-east-2 | 0.086 | 1499 |
| us-gov-east-1 | 0.099 | 1646 |
| us-gov-west-1 | 0.314 | 193 |
| us-west-1 | 0.267 | 3409 |
| us-west-2 | 0.321 | 155 |

