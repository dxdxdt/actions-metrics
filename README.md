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
Updated: 2026-08-02T15:55:40.462534+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.561 |  |
| ap-northeast-1 | 0.444 |  |
| ap-northeast-2 | 0.552 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.696 |  |
| ap-southeast-2 | 0.573 |  |
| ap-southeast-3 | 0.753 |  |
| ap-southeast-4 | 0.613 |  |
| ap-southeast-5 | 0.716 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.801 |  |
| ca-central-1 | 0.327 | 17 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.585 |  |
| eu-central-2 | 0.607 |  |
| eu-north-1 | 0.626 |  |
| eu-south-1 | 0.617 |  |
| eu-south-2 | 0.619 |  |
| eu-west-1 | 0.509 |  |
| eu-west-2 | 0.550 |  |
| eu-west-3 | 0.565 |  |
| il-central-1 | 0.750 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.706 |  |
| us-east-1 | 0.271 | 4932 |
| us-east-2 | 0.267 | 1673 |
| us-gov-east-1 | 0.279 | 1796 |
| us-gov-west-1 | 0.102 | 209 |
| us-west-1 | 0.043 | 3873 |
| us-west-2 | 0.100 | 172 |

