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
Updated: 2026-08-02T01:59:07.453717+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.982 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.167 | 17 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.179 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.128 | 4931 |
| us-east-2 | 0.129 | 1673 |
| us-gov-east-1 | 0.110 | 1795 |
| us-gov-west-1 | 0.215 | 209 |
| us-west-1 | 0.157 | 3868 |
| us-west-2 | 0.215 | 172 |

