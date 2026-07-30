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
Updated: 2026-07-30T22:04:31.713233+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.233 | 17 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.172 | 4923 |
| us-east-2 | 0.188 | 1672 |
| us-gov-east-1 | 0.156 | 1788 |
| us-gov-west-1 | 0.191 | 208 |
| us-west-1 | 0.134 | 3857 |
| us-west-2 | 0.190 | 172 |

