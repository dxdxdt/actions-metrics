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
Updated: 2026-08-24T14:34:02.823074+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.906 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.145 | 18 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.087 | 5053 |
| us-east-2 | 0.111 | 1683 |
| us-gov-east-1 | 0.117 | 1878 |
| us-gov-west-1 | 0.280 | 227 |
| us-west-1 | 0.239 | 4045 |
| us-west-2 | 0.280 | 186 |

