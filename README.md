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
Updated: 2026-04-23T08:51:59.122436+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.951 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.457 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.437 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.103 | 4546 |
| us-east-2 | 0.082 | 1526 |
| us-gov-east-1 | 0.083 | 1662 |
| us-gov-west-1 | 0.254 | 194 |
| us-west-1 | 0.201 | 3462 |
| us-west-2 | 0.252 | 157 |

