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
Updated: 2026-08-16T08:19:24.426193+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.777 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.184 | 18 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.124 | 5006 |
| us-east-2 | 0.150 | 1679 |
| us-gov-east-1 | 0.149 | 1832 |
| us-gov-west-1 | 0.237 | 223 |
| us-west-1 | 0.189 | 3964 |
| us-west-2 | 0.238 | 179 |

