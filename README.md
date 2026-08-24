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
Updated: 2026-08-24T22:17:50.914715+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.138 | 18 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.375 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.088 | 5055 |
| us-east-2 | 0.103 | 1683 |
| us-gov-east-1 | 0.113 | 1881 |
| us-gov-west-1 | 0.284 | 227 |
| us-west-1 | 0.230 | 4048 |
| us-west-2 | 0.283 | 186 |

