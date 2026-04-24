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
Updated: 2026-04-24T22:34:14.259698+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.862 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.095 | 4559 |
| us-east-2 | 0.095 | 1528 |
| us-gov-east-1 | 0.093 | 1663 |
| us-gov-west-1 | 0.276 | 194 |
| us-west-1 | 0.218 | 3471 |
| us-west-2 | 0.274 | 157 |

