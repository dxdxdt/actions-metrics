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
Updated: 2026-05-15T22:46:28.817091+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.817 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.811 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.909 |  |
| ap-southeast-6 | 0.824 |  |
| ap-southeast-7 | 0.988 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.416 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.348 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.498 |  |
| us-east-1 | 0.062 | 4643 |
| us-east-2 | 0.097 | 1595 |
| us-gov-east-1 | 0.094 | 1692 |
| us-gov-west-1 | 0.314 | 195 |
| us-west-1 | 0.271 | 3565 |
| us-west-2 | 0.321 | 158 |

