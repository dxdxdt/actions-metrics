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
Updated: 2026-03-16T17:00:33.470112+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.147 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.786 |  |
| me-south-1 | 0.756 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.091 | 4291 |
| us-east-2 | 0.129 | 1429 |
| us-gov-east-1 | 0.126 | 1577 |
| us-gov-west-1 | 0.275 | 186 |
| us-west-1 | 0.235 | 3242 |
| us-west-2 | 0.277 | 148 |

