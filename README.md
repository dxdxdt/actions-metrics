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
Updated: 2026-03-07T15:16:49.999687+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.009 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.689 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.856 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.186 | 4235 |
| us-east-2 | 0.158 | 1407 |
| us-gov-east-1 | 0.159 | 1538 |
| us-gov-west-1 | 0.172 | 174 |
| us-west-1 | 0.145 | 3191 |
| us-west-2 | 0.172 | 142 |

